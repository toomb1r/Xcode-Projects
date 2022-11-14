//
//  SpriteView.swift
//  AnimationP2
//
//  Created by wsucatslabs on 11/14/22.
//

import SwiftUI

struct SpriteView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SpriteView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteView()
    }
}

init(scene: SKScene, transition: SKTransition?, isPaused: Bool, preferredFramesPerSecond: Int)
init(scene: SKScene, transition: SKTransition?, isPaused: Bool, preferredFramesPerSecond: Int, options: SpriteView.Options, shouldRender: (TimeInterval) -> Bool)
init(scene: SKScene, transition: SKTransition?, isPaused: Bool, preferredFramesPerSecond: Int, options: SpriteView.Options, debugOptions: SpriteView.DebugOptions, shouldRender: (TimeInterval) -> Bool)
struct SpriteView.Options
struct SpriteView.DebugOptions

func contextMenu<I, M>(forSelectionType: I.Type, menu: (Set<I>) -> M, primaryAction: ((Set<I>) -> Void)?) -> View
func copyable<T>(() -> [T]) -> View
func cuttable<T>(for: T.Type, action: () -> [T]) -> View
func draggable<V, T>(() -> T, preview: () -> V) -> View
func dropDestination<T>(for: T.Type, action: ([T], CGPoint) -> Bool, isTargeted: (Bool) -> Void) -> View
func exportableToServices<T>(() -> [T]) -> View
func exportableToServices<T>(() -> [T], onEdit: ([T]) -> Bool) -> View
func focusedObject<T>(T) -> View
func focusedObject<T>(T?) -> View
func focusedSceneObject<T>(T) -> View
func focusedSceneObject<T>(T?) -> View
func focusedSceneValue<T>(WritableKeyPath<FocusedValues, T?>, T?) -> View
func focusedValue<Value>(WritableKeyPath<FocusedValues, Value?>, Value?) -> View
func fontDesign(Font.Design?) -> View
func fontWidth(Font.Width?) -> View
func importableFromServices<T>(for: T.Type, action: ([T]) -> Bool) -> View
func monospaced(Bool) -> View
func navigationDestination<V>(isPresented: Binding<Bool>, destination: () -> V) -> View
func pasteDestination<T>(for: T.Type, action: ([T]) -> Void, validator: ([T]) -> [T]) -> View
func scrollContentBackground(Visibility) -> View
func searchScopes<V, S>(Binding<V>, scopes: () -> S) -> View
func searchSuggestions<S>(() -> S) -> View
func searchSuggestions(Visibility, for: SearchSuggestionsPlacement.Set) -> View
func toolbar(Visibility, for: ToolbarPlacement...) -> View
func toolbarBackground(Visibility, for: ToolbarPlacement...) -> View
func toolbarColorScheme(ColorScheme?, for: ToolbarPlacement...) -> View
func toolbarTitleMenu<C>(content: () -> C) -> View
